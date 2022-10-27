app.controller("product-ctrl", function ($scope, $http) {
	$scope.pageSize = 10;

	$scope.items = [];
	$scope.cates = [];
	$scope.brand = [];
	$scope.form = {};
	const mapBrand = new Map();
	const mapCate = new Map();
	
	$scope.initilize = function (){
		$http.get("/rest/products").then(resp =>{
			$scope.items = resp.data;
			$scope.items.forEach(item => {
				item.createDate = new Date(item.createDate)
			})
		})
		
		$http.get("/rest/categories").then(resp =>{
			$scope.cates = resp.data;
			
			for (let x in $scope.cates) {
  				mapCate.set($scope.cates[x].id, $scope.cates[x]);
			}
		})
		
		
		$http.get("/rest/brand").then(resp =>{
			$scope.brand = resp.data;
			
			for (let x in $scope.brand) {
  				mapBrand.set($scope.brand[x].id, $scope.brand[x]);
			}
		});
	}
	
	$scope.edit = function(item){
		$scope.form = angular.copy(item);
	}
	
	$scope.changeImage = function (files){
		//console.log(files)
		var data = new FormData();
		data.append("file", files[0]);
        $http.post("/rest/upload/ImageP", data, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        }).then(resp => {
			$scope.form.image = resp.data.name;
			console.log($scope.form.image);
        }).catch(error => {
            alert("Lỗi upload hình ảnh");
            console.log("Error ", error);
        });
        
	}
	
	$scope.create = function(){
		let item = angular.copy($scope.form);
		if(item.available == undefined) {
			item.available = true;
		}
		$http.post('/rest/products', item).then(resp =>{
			resp.data.createDate = new Date(resp.data.createDate);
			$scope.itemsNew = resp.data;
			$scope.itemsNew.brand = mapBrand.get(resp.data.brand.id);
			$scope.itemsNew.category = mapCate.get(resp.data.category.id);
			$scope.items.push($scope.itemsNew);
			$scope.reset();
			alert("Thêm mới thành công sản phẩm!");
		}).catch(err => {
			alert("Lỗi thêm mới sản phẩm!");
			console.log(err);
		});
	}
	
	$scope.update = function(){
		let item = angular.copy($scope.form);
		$http.put(`/rest/products/${item.id}`, item).then(resp => {
			let i = $scope.items.findIndex(p => p.id == item.id);
			item.brand = mapBrand.get(item.brand.id);
			item.category = mapCate.get(item.category.id);
			$scope.items[i] = item;
			
			alert("Cập nhật thành công sản phẩm!");
		}).catch(err => {
			alert("Lỗi cập nhật sản phẩm!");
			console.log(err);
		});
	}
	
	$scope.delete = function(id){
		$http.delete(`/rest/products/${id}`).then(resp => {
			let i = $scope.items.findIndex(p => p.id == id);
			$scope.items.splice(i, 1);
			$scope.reset();
			alert("Xóa thành công sản phẩm!");
		}).catch(err => {
			alert("Lỗi xóa sản phẩm!");
			console.log(err);
		});
	}
	
	$scope.reset = function(){
		$scope.form = {
			image: 'no_img.png',
			category: {id: 1},
			brand: {id: 1},
			available: true,
			createDate: new Date()
		};
	}
	
	$scope.initilize();
	$scope.reset();
})