const express = require('express');
const router = express.Router();
var multer  = require('multer')
var upload = multer({ dest: 'uploads/' })

const customEmployee = require('../controllers/employeeController');


router.get('/', customEmployee.list);

router.post('/add', customEmployee.save);
router.get('/delete/:id', customEmployee.delete);


router.get('/update/:id', customEmployee.edit);
router.post('/update/:id', customEmployee.update);

module.exports = router;