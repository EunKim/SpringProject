<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html, body, #map-canvas {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#panel {
	position: absolute;
	top: 5px;
	left: 50%;
	margin-left: -180px;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
}
</style>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfqAS23g_usi75iNlUK8qs7xnG99o5zGU&libraries=places&callback=initAutocomplete"
	async defer></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript">
	var map;
	var geocoder;
	var heatmap;
	var markers = [];

	//구글 검색시 연관검색어 처럼 검색할수 있게 해주는것.
	function initAutocomplete() {

		autocomplete = new google.maps.places.Autocomplete((document
				.getElementById('autocomplete')), {
			types : [ 'geocode' ]
			
		});

		autocomplete.addListener('place_changed', fillInAddress);
	}
	
	function fillInAddress() {
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }

        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
      }

      function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }

	//지도를 기본적으로 생성 해주고, 안에 여러개의 기본으로 찍어줄 지역을 배열로 담아 놓음
	function initialize() {
		var mapOptions = {
			zoom : 15,
			center : new google.maps.LatLng(37.497985, 127.027664), //서울
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		
		var addressList = new Array('전주', '대구', '광주', '부산', '포항', '강릉', '강남역');
		for ( var j in addressList) {
			codeAddress(addressList[j]);
		}

		 /* google.maps.event.addListener('click', function(event) {
			placeMarker(map, event.latLng);
		});  */
		
		google.maps.event.addListener(map,'click', function(event) {
			  placeMarker(map,event.latLng);
		});
		
	}

	//여러 지역 기본으로 찍었을때
	function codeAddress(address) {
		geocoder = new google.maps.Geocoder();
		//var address = document.getElementById('address').value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {

			if (status == google.maps.GeocoderStatus.OK) {
				var lat = results[0]['geometry']['location']['lat']();
				var lng = results[0]['geometry']['location']['lng']();

				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location,
					draggable : false,
					animation : google.maps.Animation.DROP,
					title : address
				});
			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}

	//검색해서 찍을때
	function Address() {
		deleteMarkers();
		geocoder = new google.maps.Geocoder();
		var infowindow = new google.maps.InfoWindow;
		var getaddress = document.getElementById('autocomplete').value;

		geocoder.geocode({'address' : getaddress}, function(results, status) {

			if (status == google.maps.GeocoderStatus.OK) {
				var lat = results[0]['geometry']['location']['lat']();
				var lng = results[0]['geometry']['location']['lng']();

				/* var infowindow = new google.maps.InfoWindow({
					content : getaddress,
					maxWidth : 200
				}); */

				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : map,
					title : "주소",
					position : results[0].geometry.location,
					draggable : true,
					animation : google.maps.Animation.BOUNCE
					
				});
				markers.push(marker);
				
				infowindow.setContent(getaddress);
	            infowindow.open(map, marker);
	            document.getElementById('checkplace').value = getaddress; 
				
				/* marker.addListener('click', function() {
					infowindow.open(map, marker);
			
				}); */

			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}
	
	

	function placeMarker(map, location) {
		deleteMarkers();
		var geocoder = new google.maps.Geocoder;
		var infowindow = new google.maps.InfoWindow;
		
		/*  var marker = new google.maps.Marker({
			position : location,
			map : map,
			animation : google.maps.Animation.BOUNCE
		}); */
		geocodeLatLng(geocoder, map, infowindow, location.lat(), location.lng());
		
		/* var infowindow = new google.maps.InfoWindow({
			content : location.geocode() + " "+
				'Latitude: ' + location.lat() + '<br>Longitude: '
					+ location.lng() 
		});
		infowindow.open(map, marker); */
		
	}
	
	function geocodeLatLng(geocoder, map, infowindow, lat, lng) {
		deleteMarkers();
        var latlng = {lat: parseFloat(lat), lng: parseFloat(lng)};
        geocoder.geocode({'location': latlng}, function(results, status) {
          if (status === 'OK') {
            if (results[1]) {
              map.setZoom(15);
              var marker = new google.maps.Marker({
            	title : "주소",
            	position: latlng,
                map: map,
                animation : google.maps.Animation.BOUNCE
              });
              markers.push(marker);
              
              infowindow.setContent(results[1].formatted_address);
              infowindow.open(map, marker);
             document.getElementById('checkplace').value = results[1].formatted_address; 
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });
      }
	
	

	function deleteMarkers() {
		clearMarkers();
		markers=[];
	}

	function clearMarkers() {
		setMapOnAll(null);
	}
	
	function setMapOnAll(map) {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(map);
        }
     }
	
	/* function CheckAddress(){
		var str = $('#checkplace').val();
		alert(str); */
		
		/* window.opener.location.href="redirect:/board/writeform.do";
		 */
		/* 
		var str = $("#checkplace", opener.document).val() + $('#addressplace').val();
		alert(str); 
		$("#checkplace", opener.document).val(str);
		$(opener.document).find("#checkplace").val(str);  */
		
		//window.opener.location.href="redirect:/board/writeform.do";
		//opener.document.getElementById('addressplace').value = document.getElementById('checkplace').value;
		
		//window.close();

	//}
	
	 $(document).ready(function(){
		$('#CheckAddress').click(function(){
			//var str = $('#checkplace').val();
			//alert(str);
			opener.document.getElementById('location').value = document.getElementById('checkplace').value;
			window.close();
		});
	});
	
</script>
<body onload="initialize()">

	<div id="panel">
		<form name="map">
		<input id="autocomplete" name = "autocomplete" type="text" size="40" onFocus="geolocate()">
		<input type="button" value="검색" onclick="Address()">
		
		<input type="button" value="선택" id="CheckAddress">
		<input type="hidden" id="checkplace" name="checkplace">
		</form>
	</div>
	<div id="map-canvas" style="width: 100%; height: 680px"></div>
</body>

</html>