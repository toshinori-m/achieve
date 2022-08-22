<template>
  <div class="lesson">
    <h1>トレーニング メニュー</h1>
    <h2>＜距離走＞</h2>
    <p>これをやらなければマラソンは走れません。ペース設定を守って行うことでスタミナだけでなく走り続ける自力が身に付きます。<br>
        目的はAT（無酸素閾値）ペース向上、強度を保って２０km〜３０kmを走る。</p>
    <table border="1">
      <tr>
        <th>ターゲット<br>タイム</th><th>レースペース</th><th>距離走<br>目安ペース</th><th>頻度</th></tr>
      <tr>
        <td>サブ３</td><td>４分１５秒／km</td><td>４分３０秒〜<br>４分４５秒／km</td><td>２週間／回</td>
      </tr>
      <tr>
        <td>サブ３、１５</td><td>４分３７秒／km</td><td>４分５２秒〜<br>５分０７秒／km</td><td>２回／月</td>
      </tr>
      <tr>
        <td>サブ３、５</td><td>４分５８秒／km</td><td>５分１３秒〜<br>５分２８秒／km</td><td>１〜２回／月</td>
      </tr>
    </table>
    <h2>＜ミドル走＞</h2>
    <p>距離がこなせるようになったら取り入れる。より強度の高いポイント練習。イーブンペースで走り抜くことが大切。<br>
          距離走より少し早いペースで、距離走より短い距離１５〜２０kmを走る。</p>
    <table border="1">
      <tr>
        <th>ターゲット<br>タイム</th><th>レースペース</th><th>ミドル走<br>目安ペース</th><th>頻度</th></tr>
        <tr>
          <td>サブ３</td><td>４分１５秒／km</td><td>４分２０秒〜<br>４分２８秒／km</td><td>１回／週</td>
        </tr>
        <tr>
          <td>サブ３、１５</td><td>４分３７秒／km</td><td>４分４２秒〜<br>４分５０秒／km</td><td>１回／週</td>
        </tr>
        <tr>
          <td>サブ３、５</td><td>４分５８秒／km</td><td>５分０３秒〜<br>５分１１秒／km</td><td>１回／週</td>
      </tr>
    </table>
    <h2>＜ペース走＞</h2>
    <p>早いペースを維持して一定の処理を走ることで、心肺への刺激を入れつつ筋持久力向上するためのメニュー。<br>
            ペースの目安は５〜１０kmをイーブンで走れる限界ペース。</p>
    <table border="1">
      <tr>
        <th>ターゲット<br>タイム</th><th>レースペース</th><th>ペース走<br>目安ペース</th><th>頻度</th></tr>
        <tr>
          <td>サブ３</td><td>４分１５秒／km</td><td>３分５０秒〜<br>４分００秒／km</td><td>２週間／回</td>
        </tr>
        <tr>
          <td>サブ３、１５</td><td>４分３７秒／km</td><td>４分０５秒〜<br>４分１５秒／km</td><td>２週間／回</td>
        </tr>
        <tr>
          <td>サブ３、５</td><td>４分５８秒／km</td><td>４分２０秒〜<br>４分３０秒／km</td><td>３週間／回</td>
      </tr>
    </table>
    <h2>＜インターバル走＞</h2>
    <p>サブスリーにはスピード養成が不可欠。１回／週、インターバル走を取り入れて心肺機能と筋力の強化を図る。
      <br>やり方は１０００mのインターバル走なら５本がちょうど良いでしょう。１０００mの早いペースと２００m程度の<br>ジョグで繋ぐを繰り返しながら走る。全部同じペースか４〜５本目でペースを上げられるように意識しましょう。
    </p>
    <table border="1">
      <tr>
        <th>ターゲット<br>タイム</th><th>レースペース</th><th>インターバル走<br>目安ペース</th><th>頻度</th></tr>
        <tr>
        <td>サブ３</td><td>４分１５秒／km</td><td>１０００m × ５本<br>３分５０秒以内<br>or<br>２０００m × ３本<br>８分００秒以内</td><td>１回／週</td>
        </tr>
        <tr>
          <td>サブ３、１５</td><td>４分３７秒／km</td><td>１０００m × ５本<br>４分００秒以内<br>or<br>２０００m × ２本<br>８分２０秒以内</td><td>２週間／回</td>
        </tr>
        <tr>
          <td>サブ３、５</td><td>４分５８秒／km</td><td>１０００m<br> × ３〜５本<br>４分１５秒以内</td><td>２週間／回</td>
        </tr>
    </table>
  </div>
</template>

<style>
  .lesson h1 {
    padding: 20px 20px;
    font-size: 3em;
    margin-bottom: 30px;
    text-align: center;
    color: white;
    text-shadow: 1px 1px 2px blue;
  }
  .lesson h2 {
    font-size: 1.5em;
    color: red;
    letter-spacing: -1px;
    margin: 50,1000,100,100px;
  }
  .lesson p {
    font-size: 1.1em;
    line-height: 1.7em;
    background-color: #fff;
  }
  .lesson table {
    text-align: left;
    border-collapse: collapse;
    border: solid 4px orange;
    background-color: #fff;
  }
  .lesson table th {
    padding: 10px;
  }
  .lesson table td {
    padding: 5px 10px;
  }
</style>