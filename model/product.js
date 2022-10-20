/** @format */

const db = require('../helper/db_connections');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { deletecover, updatecover } = require('../helper/updatefiles');
const FileValidation = require('../helper/filevalidation');
const { error, success } = require('../helper/message');

module.exports = {
	addNewProduct: (req, res) => {
		return new Promise((resolve, reject) => {
			const {
				product_name,
				product_picture,
				product_category,
				product_detail,
				product_description,
				product_delivery_method,
				product_stock,
				xl,
				l,
				r,
				size100g,
				size250g,
				size500g,
				sizeaddon,
			} = req.body;
			if (req.file) {
				if (FileValidation(req.file.filename) != 1) {
					reject({
						message:
							'Format File Tidak Didukung ! , Format Yang Di Izinkan : Jpg,Png,Jpeg,Webp',
						status: 400,
					});
				} else {
					let product_size = [];
					let product_price = [];
					db.query(
						`INSERT into product (product_name,product_picture,product_category,product_detail,product_description,product_delivery_method,product_stock) 
					   Values ("${product_name}","${
							req.file.filename
						}" ,"${product_category.toLowerCase()}","${product_detail}","${product_description}","${product_delivery_method}","${product_stock}")`,
						(err, result) => {
							const lastid = result.insertId;

							if (err) {
								reject({
									message: 'Data Product Gagal Di Tambahkan',
									status: 400,
								});
							} else {
								if (
									product_category.toLowerCase() == 'coffee' ||
									product_category.toLowerCase() == 'noncoffee'
								) {
									(product_size[0] = 'xl'),
										(product_size[1] = 'l'),
										(product_size[2] = 'r'),
										(product_price[0] = xl),
										(product_price[1] = l),
										(product_price[2] = r);
									db.query(
										`UPDATE product SET price_range = "${product_price[0]},${product_price[1]},${product_price[2]}" Where product_id = ${lastid}`
									);
									for (let i = 0; i <= 2; i++) {
										db.query(
											`insert into price (product_id,product_size,product_price) values("${lastid}","${product_size[i]}","${product_price[i]}")`
										);
									}
								} else if (product_category.toLowerCase() == 'food') {
									(product_size[0] = '100g'),
										(product_size[1] = '250g'),
										(product_size[2] = '500g'),
										(product_price[0] = size100g),
										(product_price[1] = size250g),
										(product_price[2] = size500g);
									db.query(
										`UPDATE product SET price_range = "${product_price[0]},${product_price[1]},${product_price[2]}" Where product_id = ${lastid}`
									);
									for (let i = 0; i <= 2; i++) {
										db.query(
											`insert into price (product_id,product_size,product_price) values("${lastid}","${product_size[i]}","${product_price[i]}")`
										);
									}
								} else if (product_category.toLowerCase() == 'addon') {
									(product_size[0] = 'r'), (product_price[0] = sizeaddon);
									db.query(
										`UPDATE product SET price_range = "${product_price[0]}" Where product_id = ${lastid}`
									);
									db.query(
										`insert into price (product_id,product_size,product_price) values("${lastid}","${product_size[0]}","${product_price[0]}")`
									);
								}
								resolve({
									message: 'Product Makanan Berhasil Di Tambahkan !',
									status: 200,
									result,
								});
							}
						}
					);
				}
			} else {
				res.status(400).send({
					message: 'Foto Product Tidak Boleh Kosong',
				});
			}
		});
	},
	getAllProduct: (req, res) => {
		//get All Movies With Join
		return new Promise((resolve, reject) => {
			const { limit, page, order_by, sort, category } = req.query;
			let offset = page * limit - limit;
			if (category == 'all') {
				db.query(
					`SELECT product_id,product_name, product_picture,product_category,product_detail,product_description,price_range,product_delivery_method,product_stock,product_buy_count
					from product ORDER BY ${order_by} ${sort} limit ${limit} OFFSET ${offset} `,
					(error, result) => {
						if (error) {
							reject({
								message: `Failed To get Product , ${error}`,
								status: 400,
							});
						} else {
							db.query(`select * from product`, (error2, result2) => {
								let totalpage = Math.ceil(result2.length / limit);
								resolve({
									message: 'Get All Accepted Post Success',
									status: 200,
									totalpage: totalpage,
									totalRow: result.length,
									totaldata: result2.length,
									list: result,
								});
							});
						}
					}
				);
			} else {
				db.query(
					`SELECT product_id,product_name, product_picture,product_category,product_detail,product_description,price_range,product_delivery_method,product_stock,product_buy_count
					from product where product_category = '${category}' ORDER BY ${order_by} ${sort} limit ${limit} OFFSET ${offset} `,
					(error, result) => {
						if (error) {
							reject({
								message: `Failed To get Product , ${error}`,
								status: 400,
							});
						} else {
							db.query(
								`select * from product where product_category = '${category}'`,
								(error2, result2) => {
									let totalpage = Math.ceil(result2.length / limit);
									resolve({
										message: 'Get All Accepted Post Success',
										status: 200,
										totalpage: totalpage,
										totalRow: result.length,
										totaldata: result2.length,
										list: result,
									});
								}
							);
						}
					}
				);
			}
		});
	},
	getProduct: (req, res) => {
		//get All Movies With Join
		return new Promise((resolve, reject) => {
			const { id } = req.query;

			db.query(
				`SELECT product_id,product_name, product_picture,product_category,product_detail,product_description,price_range,product_delivery_method,product_stock,product_buy_count
					from product where product_id = ${id} `,
				(error, result) => {
					if (error) {
						reject({
							message: `Failed To get Product Tes Product, ${error}`,
							status: 400,
						});
					} else {
						resolve({
							message: 'Get All Accepted Post Success',
							status: 200,
							list: result,
						});
					}
				}
			);
		});
	},
	getOrder: (req, res) => {
		//get All Movies With Join
		return new Promise((resolve, reject) => {
			const { id } = req.query;

			db.query(
				`SELECT * from orders where profile_id = ${id} AND NOT order_status = 'done'  `,
				(error, result) => {
					if (error) {
						reject({
							message: `Failed To get Product Tes Product, ${error}`,
							status: 400,
						});
					} else {
						resolve({
							message: 'Get All Accepted Post Success',
							status: 200,
							list: result,
						});
					}
				}
			);
		});
	},
	updateOrder: (req, res) => {
		//get All Movies With Join
		return new Promise((resolve, reject) => {
			const { order_id, status } = req.query;

			db.query(
				`UPDATE orders SET order_status = '${status}' where orders_id= '${order_id}' `,
				(error, result) => {
					if (error) {
						console.log('errorrrr');
						reject({
							message: `Failed To get Product Tes Product, ${error}`,
							status: 400,
						});
					} else {
						resolve({
							message: 'Get All Accepted Post Success',
							status: 200,
							list: result,
						});
					}
				}
			);
		});
	},
	getAllOrder: (req, res) => {
		//get All Movies With Join
		return new Promise((resolve, reject) => {
			db.query(
				`SELECT * from orders where NOT order_status = 'done' AND NOT order_status='canceled' `,
				(error, result) => {
					if (error) {
						reject({
							message: `Failed To get Product Tes Product, ${error}`,
							status: 400,
						});
					} else {
						resolve({
							message: 'Get All Accepted Post Success',
							status: 200,
							list: result,
						});
					}
				}
			);
		});
	},
	addOrder: (req, res) => {
		return new Promise((resolve, reject) => {
			const {
				name,
				profile_id,
				product_id,
				order_price,
				order_address,
				order_payment_method,
				order_size,
				order_quantity,
			} = req.query;

			db.query(
				`INSERT into orders (product_name,profile_id,product_id,order_price,order_address,order_payment_method,order_size,order_quantity) 
					   Values ("${name}","${profile_id}","${product_id}","${order_price}" ,"${order_address}","${order_payment_method}","${order_size}","${order_quantity}")`,
				(err, result) => {
					if (err) {
						console.log('error');
						reject({
							message: 'Data Order Gagal Di Tambahkan',
							err,
							status: 400,
						});
					} else {
						console.log('berhasil');
						resolve({
							message: 'Order Berhasil Di Tambahkan !',
							status: 200,
							result,
						});
					}
				}
			);
		});
	},

	getAllWaitingPost: (req, res) => {
		//get All Movies With Join
		return new Promise((resolve, reject) => {
			const { limit, page, order_by, sort } = req.query;
			let offset = page * limit - limit;
			db.query(
				`SELECT * from post where post_status = 'waiting' ORDER BY ${order_by} ${sort} limit ${limit} OFFSET ${offset} `,
				(error, result) => {
					db.query(
						`SELECT * from post where post_status = 'accepted'`,
						(error2, result2) => {
							let totalpage = Math.ceil(result2.length / limit);
							if (error || error2) {
								console.log(error, 'ini error 1', error2, 'ini error 2');
								reject({
									message: 'Failed To Get All Accepted Post',
									status: 400,
								});
							} else {
								resolve({
									message: 'Get All Accepted Post Success',
									status: 200,
									totalpage: totalpage,
									totalRow: result.length,
									totaldata: result2.length,
									list: result,
								});
							}
						}
					);
				}
			);
		});
	},
	UpdatePost: (req, res) => {
		return new Promise((resolve, reject) => {
			const { post_cover, post_title, post_category, post_fill, post_link } =
				req.body;
			const { post_id } = req.query;
			if (req.file) {
				if (FileValidation(req.file.filename) != 1) {
					reject({
						message:
							'Format File Tidak Didukung ! , Format Yang Di Izinkan : Jpg,Png,Jpeg,Webp',
						status: 400,
					});
				} else {
					if (updatecover(post_id) == 0) {
						reject({
							message: 'POST ID TIDAK DITEMUKAN',
						});
					} else {
						console.log(req.file.filename, 'ini filename nya');
						db.query(
							`UPDATE post SET post_cover='${req.file.filename}', post_title='${post_title}',post_category = '${post_category}',post_fill='${post_fill}'
					   where post_id = '${post_id}'`,
							(err, result) => {
								if (err) {
									reject({
										message: 'Data Artikel Tidak Berhasil Di Update',
										status: 400,
									});
								} else {
									resolve({
										message: 'Artikel Berhasil Di Update',
										status: 200,
										result,
									});
								}
							}
						);
					}
				}
			} else {
				res.status(400).send({
					message: 'Cover Artikel Tidak Boleh Kosong',
				});
			}
		});
	},
	UpdatePostStatus: (req, res) => {
		return new Promise((resolve, reject) => {
			const { post_status } = req.query;
			const { post_id } = req.query;
			db.query(
				`Select profile_id from post where post_id = '${post_id}'`,
				(err, result) => {
					if (err) {
						reject({
							message: 'Terdapat Kesalahan pada Database',
							status: 400,
						});
					} else if (!result.length) {
						reject({
							message: `Artikel Dengan ID ${post_id} Tidak Ditemukan`,
							status: 400,
						});
					} else {
						let target_profile_id = result[0].profile_id;

						db.query(
							`UPDATE post SET post_status='${post_status}' where post_id = '${post_id}'`,
							(err, resultupdate) => {
								if (err) {
									reject({
										message: 'Gagal Mengubah Status Artikel',
										status: 400,
									});
								} else {
									db.query(
										`INSERT into notification (target_profile_id,from_profile_id,notification_message) 
									Values ("${target_profile_id}",1,'Admin Has Been ${post_status} Your Post')`,
										(erraddnotif, resultnotif) => {
											if (erraddnotif) {
												reject({
													message: `Gagal Ketika Menambahkan Notifikasi ${erraddnotif}`,
												});
											} else if (resultnotif) {
												if (
													resultupdate &&
													post_status.toLowerCase() == 'declined'
												) {
													resolve({
														message:
															'Artikel Telah DiTolak Untuk Di Publikasikan !! ',
														status: 200,
														resultupdate,
														resultnotif,
													});
												} else {
													resolve({
														message:
															'Artikel Telah Di Setujui untuk di publikasikan !! ',
														status: 200,
														resultupdate,
														resultnotif,
													});
												}
											}
										}
									);
								}
							}
						);
					}
				}
			);
		});
	},
	UpdateAllPostStatus: (req, res) => {
		return new Promise((resolve, reject) => {
			const { post_status } = req.query;
			let profile_result = [];
			if (
				post_status.toLowerCase() == 'accepted' ||
				post_status.toLowerCase() == 'declined'
			) {
				db.query(
					`Select * from post where post_status = 'waiting'`,
					(err, result) => {
						if (err) {
							reject({
								message: 'Terdapat Kesalahan pada Database',
								status: 400,
							});
						} else if (!result.length) {
							reject({
								message: `Tidak Ada Postingan yang menuunggu untuk diverifikasi !!`,
								status: 400,
							});
						} else {
							for (let i = 0; i < result.length; i++) {
								profile_result[i] = result[i].profile_id;
							}
							db.query(
								`UPDATE post SET post_status='${post_status}' where post_status = 'waiting' `,
								(err, result) => {
									if (err) {
										reject({
											message: 'Gagal Mengubah Status waiting Artikel',
											status: 400,
										});
									} else if (result) {
										for (let i = 0; i < profile_result.length; i++) {
											db.query(
												`INSERT into notification (target_profile_id,from_profile_id,notification_message) 
											Values ("${profile_result[i]}",1,'Admin Has Been ${post_status} Your Post')`,
												(erraddnotif, resultnotif) => {
													if (erraddnotif && i == profile_result.length - 1) {
														reject({
															message: `Gagal Ketika Menambahkan Notifikasi ${erraddnotif}`,
														});
													} else if (
														resultnotif &&
														i == profile_result.length - 1
													) {
														if (post_status.toLowerCase() == 'declined') {
															resolve({
																message: `Status Semua Artikel waiting dirubah menjadi ${post_status} `,
																status: 200,
																result,
															});
														} else if (
															post_status.toLowerCase() == 'accepted'
														) {
															resolve({
																message: `Status Semua Artikel waiting dirubah menjadi ${post_status} `,
																status: 200,
																result,
															});
														}
													}
												}
											);
										}
									}
								}
							);
						}
					}
				);
			} else {
				reject({
					message: `Pilihan Status Tidak Valid`,
					status: 400,
				});
			}
		});
	},
	DeletePost: (req, res) => {
		return new Promise((resolve, reject) => {
			const { post_id } = req.query;
			db.query(
				`select * from post where post_id = ${post_id}`,
				(err, result) => {
					if (!result.length || err) {
						reject({
							message: `Postingan dengan  ID Postingan = ${post_id} Tidak Ditemukan `,
						});
					} else {
						deletecover(`./upload/${result[0].post_cover}`);
						db.query(
							`delete from post where post_id = "${post_id}" `,
							(err, result) => {
								if (err) {
									reject({
										message: `Gagal Menghapus Postingan , ${err} `,
									});
								} else {
									resolve({
										message: `Postingan dengan  ID Postingan = ${post_id} Berhasil Dihapus`,
										status: 200,
										result,
									});
								}
							}
						);
					}
				}
			);
		});
	},
	getPostByID: (req, res) => {
		//get All Movies With Join
		return new Promise((resolve, reject) => {
			const { post_id } = req.query;

			db.query(
				`SELECT post.post_id,post.profile_id, post.post_cover,post.post_title,post.post_category,post.post_fill, post_statistic.like_count,post_statistic.comment_count 
				from post JOIN post_statistic on post.post_id = post_statistic.post_id
				 where post_status = 'accepted' AND post.post_id='${post_id}' `,
				(error, result) => {
					console.log(result[0].profile_id, 'ini resultnya');
					db.query(
						`SELECT * from post where post_status = 'accepted' AND  ${post_id}`,
						(error2, result2) => {
							if (error || error2) {
								reject({
									message: `Failed To Get All Accepted Post,${error2} ${error}`,
									status: 400,
								});
							} else {
								db.query(
									`select post_comment.post_id, post_comment.profile_id, profiles.profile_name,post_comment.comment_message from post_comment INNER JOIN profiles On post_comment.profile_id = profiles.profile_id WHERE post_comment.post_id='${post_id}'`,
									(errcomment, resultcomment) => {
										db.query(
											`Select profile_name from profiles where profile_id = '${result[0].profile_id}'`,
											(errsearchname, resultprofile) => {
												resolve({
													message: 'Get Post By ID Success',
													status: 200,
													list: {
														author: resultprofile,
														post: result,
														comment: resultcomment,
													},
												});
											}
										);
									}
								);
							}
						}
					);
				}
			);
		});
	},
};



//