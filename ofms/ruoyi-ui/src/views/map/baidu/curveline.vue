<template>
  <baidu-map class="map" :center="{lng: 118.454, lat: 32.955}" :zoom="5">
    <bml-curve-line :points="points" :editing="true" @lineupdate="update"></bml-curve-line>
  </baidu-map>
</template>

<script>
import {BmlCurveLine} from 'vue-baidu-map'
export default {
  name: 'curveline',
  components: {
    BmlCurveLine
  },
  methods: {
    update (e) {
      this.points = e.target.cornerPoints
    }
  },
  data () {
    return {
      points: [
        {lng: 116.432045, lat: 39.910683},
        {lng: 120.129721, lat: 30.314429},
        {lng: 121.491121, lat: 25.127053}
      ]
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
