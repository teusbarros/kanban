<template>
    <modal :name="'card-create-' + card.column_id"  @closed="clearData">
        <form action="" class="form-basic">
            <h4>NEW CARD</h4>
            <hr>
            <label for="title">Title *</label>
            <input type="text" name="title" v-model="card.title" placeholder="Title" required>
            <label for="title">Description *</label>
            <input type="text" name="description" v-model="card.description" placeholder="Description" required>
            <div class="footer">
                <font-awesome-icon v-if="card.id == null" icon="plus-circle" class="icon" @click="storePost" />
                <font-awesome-icon v-else icon="plus-circle" class="icon" @click="updatePost" />
            </div>            
        </form>

    </modal>
</template>

<script>
export default {
    name: 'CardCreate',
    props: ['card'],
    data(){
        return {
        }
    },
    methods: {
        show () {
            this.$modal.show('card-create-' + this.card.column_id);
        },
        hide () {
            this.$modal.hide('card-create-' + this.card.column_id);
        },
        storePost() {
            console.log('criando um novo');

            if (this.card.title == '' || this.card.description == '') {
                return;
            }
            axios.post('/api/cards?title=' + this.card.title + '&description=' + this.card.description + '&column_id=' + this.card.column_id)
            .then(response => {
                this.hide();
                this.$emit('updated');
            })
            .catch(error =>{
                if (error.response?.data) {
                    //validationErrors.value = error.response.data.errors;
                }
            })
        },
        updatePost() {
            console.log('atualizando');
            if (this.card.title == '' || this.card.description == '') {
                return;
            }
            axios.put('/api/cards/'+ this.card.id +'?title=' + this.card.title + '&description=' + this.card.description + '&column_id=' + this.card.column_id)
            .then(response => {
                this.hide();
                this.$emit('updated');
            })
            .catch(error =>{
                if (error.response?.data) {
                    //validationErrors.value = error.response.data.errors;
                }
            })
        },
        clearData(){
            this.$emit('closed');
        }
    },
    mount () {
        this.show()
    }
}
</script>

<style scoped>
    input[type=text] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    form > h4{
        text-align: center;
    }
    form > hr{
        margin-bottom: 30px;
    }
</style>