<template>
    <div :id="'card-' + id" @click="editCard">
        <span>{{title}}</span>
    </div>
</template>

<script>
    export default {
        props: ['id', 'title'],
        methods:{
            editCard(){
                this.$emit('toedit');
            }
        }
    }
</script>

<style scoped>
span{
    font-size: 16px;
}
</style>