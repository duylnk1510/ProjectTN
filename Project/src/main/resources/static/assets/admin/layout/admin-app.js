app = angular.module("admin-app", ["angularUtils.directives.dirPagination","ngRoute"]);

app.config(function ($routeProvider) {
	$routeProvider
	.when("/product", {
		templateUrl: "/assets/admin/product/product.html",
		controller: "product-ctrl"
	})
	.when("/product_images", {
		templateUrl: "/assets/admin/product/product_images.html",
		controller: "product_images-ctrl"
	})
	.when("/order", {
		templateUrl: "/assets/admin/order/order.html",
		controller: "order-ctrl"
	})
	.when("/detail/:id", {
		templateUrl: "/assets/admin/order/order_detail.html",
		controller: "detail-ctrl"
	})
	.when("/account", {
		templateUrl: "/assets/admin/account/account.html",
		controller: "account-ctrl"
	})
	.when("/autho", {
		templateUrl: "/assets/admin/account/authority.html",
		controller: "authority-ctrl"
	})
	.otherwise({
		template: "<h1 class='text-center'>Administration</h1>"
	});
})