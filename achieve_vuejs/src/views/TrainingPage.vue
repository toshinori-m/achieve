<template>
  <div class="lesson">
    <h1 class="p-5 text-xl mb-7 text-center text-white text-shadow-b md:text-4xl">トレーニング メニュー</h1>
    <h2 class="text-base text-red-500 tracking-tighter md:text-xl md:mx-16">＜距離走＞</h2>
    <p class="text-sm leading-5 bg-white md:text-base rounded-xl md:mx-10  md:px-8">これをやらなければマラソンは走れません。ペース設定を守って行うことでスタミナだけでなく走り続ける自力が身に付きます。<br>
        目的はAT（無酸素閾値）ペース向上、強度を保って２０km〜３０kmを走る。</p>
    <table class="text-left border-collapse border-orange-300 bg-white border-4 text-xs md:mx-10">
      <tr class="text-center md:text-base">
        <th class="md:px-8">ターゲット<br>タイム</th><th class="border border-orange-300 border-1 md:px-8">レースペース</th><th class="border border-orange-300 border-1 md:px-14">距離走<br>目安ペース</th><th class=" md:px-14">頻度</th></tr>
      <tr class="text-center border border-orange-300 border-1">
        <td class="text-center border border-orange-300 border-1">サブ３</td><td>４分１５秒／km</td><td class="text-center border border-orange-300 border-1">４分３０秒〜<br>４分４５秒／km</td><td>２週間／回</td>
      </tr>
      <tr class="text-center border border-orange-300 border-1">
        <td class="text-center border border-orange-300 border-1">サブ３.１５</td><td>４分３７秒／km</td><td class="text-center border border-orange-300 border-1">４分５２秒〜<br>５分０７秒／km</td><td>２回／月</td>
      </tr>
      <tr class="text-center">
        <td class="text-center border border-orange-300 border-1">サブ３.５</td><td>４分５８秒／km</td><td class="text-center border border-orange-300 border-1">５分１３秒〜<br>５分２８秒／km</td><td>１〜２回／月</td>
      </tr>
    </table>
    <h2 class="mt-3 text-base text-red-500 tracking-tighter md:text-xl md:mx-16">＜ミドル走＞</h2>
    <p class="text-sm leading-5 bg-white md:text-base rounded-xl md:mx-10  md:px-8">距離がこなせるようになったら取り入れる。より強度の高いポイント練習。イーブンペースで走り抜くことが大切。<br>
          距離走より少し早いペースで、距離走より短い距離１５〜２０kmを走る。</p>
    <table class="text-left border-collapse border-orange-300 bg-white border-4 text-xs md:mx-10">
      <tr class="text-center md:text-base">
        <th class="md:px-8">ターゲット<br>タイム</th><th class="border border-orange-300 border-1 md:px-8">レースペース</th><th class="border border-orange-300 border-1 md:px-14">ミドル走<br>目安ペース</th><th class=" md:px-14">頻度</th></tr>
      <tr class="text-center border border-orange-300 border-1">
        <td class="text-center border border-orange-300 border-1">サブ３</td><td>４分１５秒／km</td><td class="text-center border border-orange-300 border-1">４分２０秒〜<br>４分２８秒／km</td><td>１回／週</td>
      </tr>
      <tr class="text-center border border-orange-300 border-1">
        <td class="text-center border border-orange-300 border-1">サブ３.１５</td><td>４分３７秒／km</td><td class="text-center border border-orange-300 border-1">４分４２秒〜<br>４分５０秒／km</td><td>１回／週</td>
      </tr>
      <tr class="text-center">
        <td class="text-center border border-orange-300 border-1">サブ３.５</td><td>４分５８秒／km</td><td class="text-center border border-orange-300 border-1">５分０３秒〜<br>５分１１秒／km</td><td>１回／週</td>
      </tr>
    </table>
    <h2 class="mt-3 text-base text-red-500 tracking-tighter md:text-xl md:mx-16">＜ペース走＞</h2>
    <p class="text-sm leading-5 bg-white md:text-base rounded-xl md:mx-10  md:px-8">早いペースを維持して一定の処理を走ることで、心肺への刺激を入れつつ筋持久力向上するためのメニュー。<br>
            ペースの目安は５〜１０kmをイーブンで走れる限界ペース。</p>
    <table class="text-left border-collapse border-orange-300 bg-white border-4 text-xs md:mx-10">
      <tr class="text-center md:text-base">
        <th class="md:px-8">ターゲット<br>タイム</th><th class="border border-orange-300 border-1 md:px-8">レースペース</th><th class="border border-orange-300 border-1 md:px-14">ペース走<br>目安ペース</th><th class=" md:px-14">頻度</th></tr>
      <tr class="text-center border border-orange-300 border-1">
        <td class="text-center border border-orange-300 border-1">サブ３</td><td>４分１５秒／km</td><td class="text-center border border-orange-300 border-1">３分５０秒〜<br>４分００秒／km</td><td>２週間／回</td>
      </tr>
      <tr class="text-center border border-orange-300 border-1">
        <td class="text-center border border-orange-300 border-1">サブ３.１５</td><td>４分３７秒／km</td><td class="text-center border border-orange-300 border-1">４分０５秒〜<br>４分１５秒／km</td><td>２週間／回</td>
      </tr>
      <tr class="text-center">
        <td class="text-center border border-orange-300 border-1">サブ３.５</td><td>４分５８秒／km</td><td class="text-center border border-orange-300 border-1">４分２０秒〜<br>４分３０秒／km</td><td>３週間／回</td>
      </tr>
    </table>
    <h2 class="mt-3 text-base text-red-500 tracking-tighter md:text-xl md:mx-16">＜インターバル走＞</h2>
    <p class="text-sm leading-5 bg-white md:text-base rounded-xl md:mx-10  md:px-8">サブスリーにはスピード養成が不可欠。１回／週、インターバル走を取り入れて心肺機能と筋力の強化を図る。
      <br>やり方は１０００mのインターバル走なら５本がちょうど良いでしょう。１０００mの早いペースと２００m程度の<br>ジョグで繋ぐを繰り返しながら走る。全部同じペースか４〜５本目でペースを上げられるように意識しましょう。
    </p>
    <table class="text-left border-collapse border-orange-300 bg-white border-4 text-xs md:mx-10">
      <tr class="text-center md:text-base">
        <th class="md:px-8">ターゲット<br>タイム</th><th class="border border-orange-300 border-1 md:px-8">レースペース</th><th class="border border-orange-300 border-1 md:px-14">インターバル走<br>目安ペース</th><th class=" md:px-14">頻度</th></tr>
      <tr class="text-center border border-orange-300 border-1">
      <td class="text-center border border-orange-300 border-1">サブ３</td><td>４分１５秒／km</td><td class="text-center border border-orange-300 border-1">１０００m × ５本<br>３分５０秒以内<br>or<br>２０００m × ３本<br>８分００秒以内</td><td>１回／週</td>
      </tr>
      <tr class="text-center border border-orange-300 border-1">
        <td class="text-center border border-orange-300 border-1">サブ３,１５</td><td>４分３７秒／km</td><td class="text-center border border-orange-300 border-1">１０００m × ５本<br>４分００秒以内<br>or<br>２０００m × ２本<br>８分２０秒以内</td><td>２週間／回</td>
      </tr>
      <tr class="text-center">
        <td class="text-center border border-orange-300 border-1">サブ３.５</td><td>４分５８秒／km</td><td class="text-center border border-orange-300 border-1">１０００m<br> × ３〜５本<br>４分１５秒以内</td><td>２週間／回</td>
      </tr>
    </table>
  </div>
</template>

<style>
</style>