<template>
    <div :id="id" class="column">
        <div class="header">
            <span class="column-title">{{name}}</span>
            <font-awesome-icon icon="minus-circle" class="icon float-right" @click="deleteColumn(id)" />
            <hr>
        </div>
        <div class="cards">
            <Card v-for="card in cards" :key="card.id" :id="card.id" class="card" :title="card.title" @updated="getCards" @toedit="showCardModal(id, card)"></Card>
        </div>
        <CardCreate :column_id="id" @updated="getCards" :card="card" @closed="clearData"></CardCreate>
        <div class="footer">
            <font-awesome-icon icon="plus-circle" class="icon" @click="showCardModal(id, card)" />
        </div>
    </div>
</template>

<script>
    export default {
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
                axios.get('/api/cards?column_id=' + this.id)
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
                                console.log(response);
                                this.$emit('updated');
                            })
                    }
                });
            },
            showCardModal(id, card){
                console.log('card ', card);
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
            }
            
        },
        mounted(){
            this.getCards();
        }
    }
</script>

<style scoped>

</style>