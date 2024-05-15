<template>
  <baidu-map class="map" :center="{lng: 105.000, lat: 38.000}" :zoom="4" :scroll-wheel-zoom="true">
    <bm-map-type :map-types="['BMAP_NORMAL_MAP', 'BMAP_HYBRID_MAP']" anchor="BMAP_ANCHOR_TOP_LEFT"></bm-map-type>
    <bm-point-collection :points="points" shape="BMAP_POINT_SHAPE_CIRCLE" color="red" size="BMAP_POINT_SIZE_SMALL" @click="clickHandler"></bm-point-collection>
  </baidu-map>
</template>

<script>
export default {
  name: 'multipoint',
  data () {
    const points = [];
    for (var i = 0; i < 1000; i++) {
      const position = {lng: Math.random() * 40 + 85, lat: Math.random() * 30 + 21}
      points.push(position)
    }
    return {
      points
    }
  },
  methods: {
    clickHandler (e) {
      alert(`单击点的坐标为：${e.point.lng}, ${e.point.lat}`);
    }
  }
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 650px;
}
</style>
