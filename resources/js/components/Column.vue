<template>
    <div :id="id" class="column">
        <div class="header">
            <span class="column-title">{{name}}</span>
            <font-awesome-icon icon="minus-circle" class="icon float-right" @click="deleteColumn(id)" />
            <hr>
        </div>

        <draggable v-model="cards" class="cards" :data-column="id" group="kanbanapp" ghostClass="on-drag" animation="400" @end="updateChange">
            <Card v-for="card in cards" :key="card.id" :id="card.id" class="card" :title="card.title" @updated="getCards" @toedit="showCardModal(id, card)"></Card>
        </draggable>
        
        <CardCreate :column_id="id" @updated="getCards" :card="card" @closed="clearData"></CardCreate>
        <div class="footer">
            <font-awesome-icon icon="plus-circle" class="icon" @click="showCardModal(id, card)" />
        </div>
    </div>
</template>

<script>
import draggable from 'vuedraggable'

    export default {
        components:{
            draggable
        },
        props: ['id', 'name'],
        data(){
            return {
                cards: [],
                card: {
                    title: '',
                    description: '',
                    column_id: this.id,
                    id: null,
                }
            }
        },
        methods: {
            getCard(id){
                axios.get('/api/cards/' + id)
                    .then(response => {
                        this.card = response.data.data;
                    })
            },
            getCards(){
                axios.get('/api/cards?access_token='+localStorage.getItem('token')+'&column_id=' + this.id)
                .then(response => {
                    this.cards = response.data.data;
                })

                this.clearData();
            },
            deleteColumn(id){
                this.$swal({
                    title: 'Are you sure?',
                    text: 'You won\'t be able to revert this action!',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, delete it!',
                    confirmButtonColor: '#ef4444',
                    timer: 20000,
                    timerProgressBar: true,
                    reverseButtons: true
                })
                .then(result => {
                    if (result.isConfirmed) {
                        axios.delete('/api/columns/' + id)
                            .then(response => {
                                this.$emit('updated');
                            })
                    }
                });
            },
            showCardModal(id, card){
                this.card = card;
                this.$modal.show('card-create-' + id);
            },
            clearData(){
                this.card = {
                    title: '',
                    description: '',
                    column_id: this.id,
                    id: null,
                }
            },
            updateChange(e){
                var id = e.item.id.split('-')[1];
                var new_column = e.to.dataset.column;
                var new_order = e.newIndex;
                this.updateCardPosition(id, new_column, new_order);
            },
            updateCardPosition(id, new_column, new_order){
                axios.post('/api/cards-position/' + id + '?new_column=' + new_column + '&new_order=' + new_order)
                .then(response => {
                    //console.log("");
                })
                .catch(error => {
                    console.log(error);
                })
            }

            
        },
        mounted(){
            this.getCards();
        }
    }
</script>

<style scoped>

</style>