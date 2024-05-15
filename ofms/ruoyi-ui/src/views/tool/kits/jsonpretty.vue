<template>
  <vue-json-pretty :path="'result'" :data="response" :showLength="true" :showDoubleQuotes="true"
                   :showSelectController="true"
                   selectableType="single"
                   :selectOnClickNode="true"
                   :collapsedOnClickBrackets="true"
                   :highlightMouseoverNode="true"> </vue-json-pretty>
</template>

<script>
import VueJsonPretty from 'vue-json-pretty';
import 'vue-json-pretty/lib/styles.css';
export default {
  name: 'jsonpretty',
  components: {
    VueJsonPretty,
  },
  data(){
    return{
      response: {
        result: '',
        data: [
          {
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
        ]
      }
    }
  }
}
</script>

<style scoped>

</style>
