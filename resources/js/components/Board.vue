<template>
    <div class="columns">
        <Column v-for="column in columns" :key="column.id" :id="column.id" :name="column.title" @updated="refreshColumns">
        </Column>
        <button class="add-column" @click="showColumnModal">
            <font-awesome-icon icon="plus-circle" class="icon" />  ADD COLUMN
        </button>
        <ColumnCreate @updated="refreshColumns"></ColumnCreate>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            columns: [],
        }
    },
    methods: {
        getColumns() {
            axios.get('/api/columns')
            .then(response => {
                this.columns = response.data.data;
            })
        },
        refreshColumns(){
            this.getColumns();
        },
        showColumnModal(){
            this.$modal.show('column-create');
        }
    },
    created(){
        this.getColumns();
    }
}
</script>

<style scoped>
.columns{
    display: flex;
    overflow-x: auto;
}
</style>