<template>
  <baidu-map class="map" center="中国" :scroll-wheel-zoom="true" :zoom="4">
    <bml-marker-clusterer :averageCenter="true">
      <bm-marker v-for="mkr of markers" :position="{lng: mkr.lng, lat: mkr.lat}"></bm-marker>
    </bml-marker-clusterer>
  </baidu-map>
</template>

<script>
import {BmlMarkerClusterer} from 'vue-baidu-map'
export default {
  name: 'markermap',
  data () {
    // 插入 10 个随机点
    const markers = []
    for (let i = 0; i < 10; i++) {
      const position = {lng: Math.random() * 40 + 85, lat: Math.random() * 30 + 21}
      markers.push(position)
    }
    return {
      markers
    }
  },
  components: {
    BmlMarkerClusterer
  }
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 650px;
}
</style>
