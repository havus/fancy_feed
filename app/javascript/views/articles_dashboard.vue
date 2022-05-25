<template>
  <div>
    <h1>hello this is article</h1>

    <ul>
      <li v-for="(article, index) in articles" :key="index">
        {{ article.title }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      articles: []
    }
  },
  created() {
    console.log('WebSocket is connected.');

    const socket = new WebSocket('ws://localhost:3000/cable');

    socket.onopen = () => {
      const subscribeMsg = {
        command: 'subscribe',
        identifier: JSON.stringify({
          channel: 'ArticleChannel',
        }),
      };

      socket.send(JSON.stringify(subscribeMsg));
    };

    socket.onmessage = (event) => {
      const response = event.data;
      const data = JSON.parse(response);

      if (data.type === 'ping')                 { return; }
      if (data.type === 'welcome')              { return; }
      if (data.type === 'confirm_subscription') { return; }

      // console.log('FROM RAILS: ', data);
      this.articles.push(data.message);
    };
  },
}
</script>

<style>

</style>