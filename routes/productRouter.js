/** @format */

const express = require('express');
const productController = require('../controller/productController');
const router = express.Router();
const upload = require('../helper/multer');
const { VerifyUser } = require('../helper/verifyAuth');
const verifyAuth = require('../helper/verifyAuth');

router.get('/', productController.getAllProduct);
router.get('/order/id', productController.getOrder);
router.get('/order/all', productController.getAllOrder);
router.get('/id', productController.getProduct);
router.patch('/order/status', productController.updateOrder);
router.get(
	'/waiting',
	verifyAuth.VerifyAdminRole,
	productController.getallWaitingpost
);
router.get('/id', productController.getpostbyid);
router.post(
	'/',
	verifyAuth.VerifyAdminRole,
	upload.single('product_picture'),
	productController.addNewproduct
);
router.post('/order', productController.addOrder);
router.patch(
	'/',
	verifyAuth.VerifyUpdatePost,
	upload.single('post_cover'),
	productController.updatepost
);
router.patch(
	'/status',
	verifyAuth.VerifyAdminRole,
	productController.updatepoststatus
);
router.patch(
	'/status/all',
	verifyAuth.VerifyAdminRole,
	productController.updateallpoststatus
);
router.delete('/', verifyAuth.VerifyUpdatePost, productController.deletepost);

module.exports = router;
