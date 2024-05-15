<template>
  <baidu-map :zoom="11" :scroll-wheel-zoom="true">
    <bm-view class="map" center="北京">
    </bm-view>
<!--    公交路线-->
<!--    <bm-transit start="百度大厦" end="北京邮电大学西门" :auto-viewport="true" location="北京"></bm-transit>-->

<!--    驾车路线-->
    <bm-driving
      start="新街口"
      end="新街口"
      startCity="北京"
      endCity="南京"
      :auto-viewport="true"
      :waypoints="['呼和浩特', {lng: 112.53, lat: 37.87}, '陕西兵马俑']"></bm-driving>
<!--    步行-->
<!--    <bm-walking start="百度大厦" end="北京邮电大学西门" :auto-viewport="true" location="北京"></bm-walking>-->
  </baidu-map>
</template>

<script>
export default {
  name: 'transit'
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 350px;
}
</style>
