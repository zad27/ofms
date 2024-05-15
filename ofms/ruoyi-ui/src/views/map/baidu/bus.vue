<template>
  <baidu-map :center="{lng: 116.332782, lat: 40.007978}" :zoom="14" :scroll-wheel-zoom="true">
    <bm-view class="map" >
    </bm-view>
    <bm-bus keyword="331" :auto-viewport="true" location="北京"></bm-bus>
  </baidu-map>
</template>

<script>
export default {
  name: 'bus'
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 400px;
}
</style>
