SELECT
	`p`.`first_name`,
	`p`.`last_name`,
	COUNT(`o`.`id`) AS `total_orders`,
	SUM(`oi`.`quantity`) AS `total_items_bought`,
	SUM(`oi`.`quantity` * `i`.`price` - `oi`.`discount`) AS `total_money_spent`
FROM `person` AS `p` 
LEFT JOIN `order` AS `o`
ON `o`.`person_id` = `p`.`id`
LEFT JOIN `order_item` AS `oi`
ON `oi`.`order_id` = `o`.`id`
LEFT JOIN `item` AS `i`
ON `i`.`id` = `oi`.`item_id`
GROUP BY `p`.`id`
ORDER BY `p`.`id`