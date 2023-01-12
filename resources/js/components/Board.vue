<template>
    <div>
        <div class="columns">
            <Column v-for="column in columns" :key="column.id" :id="column.id" :name="column.title" @updated="refreshColumns"> </Column>
            
            <div class="buttons">
                <button class="add-column" @click="downloadSql"> 
                    <font-awesome-icon icon="download" class="icon" /> DOWNLOAD SQL
                </button>
                
                <button class="add-column" @click="showColumnModal">
                    <font-awesome-icon icon="plus-circle" class="icon" />  ADD COLUMN
                </button>
            </div>
            
            <ColumnCreate @updated="refreshColumns"></ColumnCreate>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            columns: [],
            downloading: false
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
        },
        downloadSql(){
            if (this.downloading) {
                return;
            }
            
            this.downloading = true;
            
            axios.get('/api/sql')
            .then(response => {
                var anchor = document.createElement('a');
                    anchor.href = '/dump.sql';
                    anchor.download = '/dump.sql';
                    document.body.appendChild(anchor);
                    anchor.click();
            }).finally(response => {
                this.downloading = false;
            });
        }
    },
    created(){
        localStorage.setItem("token", document.getElementById('token').value);
        this.getColumns();
    }
}
</script>