<template>
    <modal name="column-create">
        <form action="" class="form-basic">
            <h4>NEW COLUMN</h4>
            <hr>
            <label for="title">Title *</label>
            <input type="text" name="title" v-model="title" placeholder="Title" required>
            <div class="footer">
                <font-awesome-icon icon="plus-circle" class="icon" @click="storePost" />
            </div>            
        </form>

    </modal>
</template>

<script>
export default {
    name: 'ColumnCreate',
    data(){
        return {
            title: '',
        }
    },
    methods: {
        show () {
            this.$modal.show('column-create');
        },
        hide () {
            this.$modal.hide('column-create');
        },
        storePost() {
            if (this.title == '') {
                return;
            }
            axios.post('/api/columns?title=' + this.title)
            .then(response => {
                
                this.hide();
                this.$emit('updated');
            })
            .catch(error =>{
                if (error.response?.data) {
                    //validationErrors.value = error.response.data.errors;
                }
            })
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