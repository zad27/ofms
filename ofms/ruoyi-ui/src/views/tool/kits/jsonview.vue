<template>
  <json-view :data="json" :deep="5"
             icon-style="square"
             theme="one-dark"
  />
</template>

<script>
//https://juejin.cn/post/6900758398816485383
// import jsonView from '@/components/json-view';
import jsonView from 'vue-json-views'
export default {
  name: 'jsonview',
  components: {
    jsonView
  },
  data() {
    return {
      json:  {
        "result": "",
        "data":
          [
            {
              "status": 200,
              "error": "",
              "data":
                [
                  {
                    "news_id": 51184,
                    "title": "iPhone X Review: Innovative future with real black technology",
                    "source": "Netease phone"
                  },
                  {
                    "news_id": 51183,
                    "title": "Traffic paradise: How to design streets for people and unmanned vehicles in the future?",
                    "source": "Netease smart",
                    "link": "http://netease.smart/traffic-paradise/1235"
                  },
                  {
                    "news_id": 51182,
                    "title":
                      "Teslamask's American Business Relations: The government does not pay billions to build factories",
                    "source": "AI Finance",
                    "members":
                      ["Daniel", "Mike", "John"]
                  }
                ]
            }
          ]
      }
    }
  }
}
</script>

<style scoped>

</style>
