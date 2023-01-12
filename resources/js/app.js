
window.Vue = require('vue').default;
const axios = require('axios');
global.axios = axios;

// icons
import { library } from '@fortawesome/fontawesome-svg-core';
import { faMinusCircle, faPlusCircle, faSave, faDownload } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

// alert
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

// modal
import VModal from 'vue-js-modal/dist/index.nocss.js'
import 'vue-js-modal/dist/styles.css'

Vue.use(VueSweetalert2);
Vue.use(VModal);

library.add(faMinusCircle);
library.add(faPlusCircle);
library.add(faSave);
library.add(faDownload);

Vue.component('Board', require('./components/Board.vue').default);
Vue.component('Column', require('./components/Column.vue').default);
Vue.component('ColumnCreate', require('./components/Modals/ColumnCreate.vue').default);
Vue.component('Card', require('./components/Card.vue').default);
Vue.component('CardCreate', require('./components/Modals/CardCreate.vue').default);
Vue.component('font-awesome-icon', FontAwesomeIcon);

const app = new Vue({
    el: '#app',
});