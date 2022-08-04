/** @format */

const Product = require('../model/product');

module.exports = {
	getAllProduct: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.getAllProduct(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	updateOrder: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.updateOrder(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	getProduct: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.getProduct(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	getOrder: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.getOrder(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	getAllOrder: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.getAllOrder(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	getpostbyid: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.getPostByID(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	getallWaitingpost: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.getAllWaitingPost(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	addNewproduct: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.addNewProduct(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	addOrder: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.addOrder(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	updatepost: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.UpdatePost(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	updatepoststatus: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.UpdatePostStatus(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	updateallpoststatus: async (req, res) => {
		//add New post From Body
		try {
			const result = await Product.UpdateAllPostStatus(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
	deletepost: async (req, res) => {
		//add New post From Body
		try {
			const result = await Post.DeletePost(req, res);
			res.status(200).send(result);
		} catch (error) {
			res.status(400).send(error);
		}
	},
};
