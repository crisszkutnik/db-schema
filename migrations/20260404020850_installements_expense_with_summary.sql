CREATE VIEW installements_expense_with_summary AS
SELECT
  ie.id,
  ie.user_id,
  ie.created_date,
  COUNT(e.id) as installment_count,
  COALESCE(SUM(e.ars_amount), 0) as total_ars_amount,
  COALESCE(SUM(e.usd_amount), 0) as total_usd_amount
FROM
  installements_expense ie
  LEFT JOIN expense e ON e.installements_expense_id = ie.id
GROUP BY
  ie.id,
  ie.user_id,
  ie.created_date;