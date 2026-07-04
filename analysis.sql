-- ① チーム別打撃成績ランキング
SELECT 
  チーム, 打率, 得点, 本塁打, 打点, 長打率, 出塁率
FROM チーム別打撃成績
ORDER BY 得点 DESC;

-- ② チーム別OPSランキング
SELECT
  チーム, 打率, 得点, 本塁打, 出塁率, 長打率,
  ROUND(出塁率 + 長打率, 3) AS OPS
FROM チーム別打撃成績
ORDER BY OPS DESC;

-- ③ 楽天と西武の投手成績比較
SELECT
  チーム, 防御率, 勝利, 敗北, 四球, 三振, 失点
FROM チーム別投手成績
WHERE チーム IN ('楽天', '西武')
ORDER BY 防御率 ASC;

-- ④ 楽天先発投手成績
SELECT
  選手名, 防御率, `先　発`, 勝利, 敗戦, `Ｑ　Ｓ`, 投球回, ＷＨＩＰ, 奪三振率
FROM 東北楽天イーグルスイーグルス選手別成績_投手
WHERE CAST(`先　発` AS INTEGER) >= 3
  AND 防御率 != '-'
ORDER BY CAST(防御率 AS REAL) ASC;

-- ⑤ 楽天野手成績
SELECT
  ポジション, 選手名, 打率, 本塁打, 打点, 得点, ＯＰＳ, 出塁率, 長打率
FROM 東北楽天イーグルスイーグルス選手別成績_野手
WHERE CAST(`打　席` AS INTEGER) >= 30
  AND 打率 != '-'
ORDER BY CAST(ＯＰＳ AS REAL) DESC;