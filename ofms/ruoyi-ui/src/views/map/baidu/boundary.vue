<template>
  <baidu-map class="map" :center="{lng: 116.403765, lat: 39.914850}" :zoom="11" :scroll-wheel-zoom="true">
    <bm-boundary name="北京市海淀区" :strokeWeight="2" strokeColor="blue"></bm-boundary>
  </baidu-map>
</template>

<script>
export default {
  name: 'boundary'
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 650px;
}
</style>
