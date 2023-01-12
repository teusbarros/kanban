require('./bootstrap');


/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;
const axios = require('axios');
global.axios = axios;

import { library } from '@fortawesome/fontawesome-svg-core';

import { faMinusCircle, faPlusCircle, faSave } from '@fortawesome/free-solid-svg-icons';

import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

import VModal from 'vue-js-modal/dist/index.nocss.js'
import 'vue-js-modal/dist/styles.css'


Vue.use(VueSweetalert2);
Vue.use(VModal);
Vue.component('Board', require('./components/Board.vue').default);
Vue.component('Column', require('./components/Column.vue').default);
Vue.component('ColumnCreate', require('./components/Modals/ColumnCreate.vue').default);
Vue.component('Card', require('./components/Card.vue').default);
Vue.component('CardCreate', require('./components/Modals/CardCreate.vue').default);

library.add(faMinusCircle);
library.add(faPlusCircle);
library.add(faSave);

Vue.component('font-awesome-icon', FontAwesomeIcon);
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});