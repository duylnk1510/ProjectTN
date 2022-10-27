app.controller("authority-ctrl", function($scope, $http) {
	$scope.roles = [];
	$scope.accounts = [];
	$scope.authorities = [];

	$scope.load = function() {

		$http.get("/rest/role").then(resp => {
			$scope.roles = resp.data;
		}).catch(err => {
			console.log("Lỗi roles" + err);
		});

		$http.get("/rest/account").then(resp => {
			$scope.accounts = resp.data;
		}).catch(err => {
			console.log("Lỗi authorities" + err);
		});

		$http.get("/rest/autho").then(resp => {
			$scope.authorities = resp.data;
		}).catch(err => {
			console.log("Lỗi authorities" + err);
		});
	}

	$scope.checkAutho = function(acc, role) {
		let item = $scope.authorities.find(au => au.account.username == acc.username && au.role.id == role.id)
		return item;
	}

	$scope.changeAutho = function(acc, role) {
		let item = $scope.checkAutho(acc, role);
		if (item) {
			$http.delete(`/rest/autho/${item.id}`).then(resp => {
				let index = $scope.authorities.findIndex(au => au.id == item.id);
				$scope.authorities.splice(index, 1);
			}).catch(err => {
				console.log("Lỗi xóa quyền" + err);
			});
		} else {
			let autho = {
				account: acc,
				role: role
			}
			$http.post("/rest/autho", autho).then(resp => {
				$scope.authorities.push(resp.data);
			}).catch(err => {
				console.log("Lỗi thêm quyền" + err);
			});
		}
	}



	$scope.load();
})