node default{
	include apache
	include modrewrite
	include php
	include mysql
	include pgsql
	include email
}