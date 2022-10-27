app.controller("order-ctrl", function($scope, $http) {
	$scope.listOrder = [];
	$scope.order = {};
	
	function load(){
		
		$http.get("/rest/order").then(resp => {
			resp.data.orderStatus = "Đã xác nhận"
			$scope.listOrder = resp.data;
		})
	}
	
	load();
	
	$scope.linkDetail = function (id){
		window.location= `#!detail/${id}`
	}
	
	$scope.xacNhan = function(order){
		//console.log(order.id)
		$scope.order = angular.copy(order);
		$scope.order.orderStatus = "Đã xác nhận";
		$http.put("/rest/orderUpdate", $scope.order).then(resp =>{
			let i = $scope.listOrder.findIndex(o => o.id = order.id);
			$scope.listOrder[i].orderStatus = "Đã xác nhận";
			alert("Đã cập nhật")
		});
	}
	
})