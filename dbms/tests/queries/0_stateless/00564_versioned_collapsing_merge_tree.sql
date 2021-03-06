drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date), 8192, sign, version);
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date, value), 8192, sign, version);
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date, value), 8192, sign, version);
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 10;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date, value), 8192, sign, version);
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 2, -1, 1) from system.numbers limit 10;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date, value), 8192, sign, version);
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 10;
select 'table with 4 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 4 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date, value), 8192, sign, version);
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 3 = 0, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 3 = 1, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 3 = 2, 1, -1) from system.numbers limit 10;
select 'table with 5 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 5 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date, value), 8192, sign, version);
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 1000000;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 1000000;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value UInt64, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date), 8192, sign, version);
insert into test.mult_tab select '2018-01-31', number, 0, if(number < 64, 1, -1) from system.numbers limit 128;
insert into test.mult_tab select '2018-01-31', number, 0, if(number < 64, -1, 1) from system.numbers limit 128;
select 'table with 2 blocks final';
select * from test.mult_tab final settings max_block_size=33;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';
select 'Vertival merge';
select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date, value) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date, value) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 10;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date, value) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 2, -1, 1) from system.numbers limit 10;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date, value) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 10;
select 'table with 4 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 4 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date, value) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 3 = 0, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 3 = 1, 1, -1) from system.numbers limit 10;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 3 = 2, 1, -1) from system.numbers limit 10;
select 'table with 5 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 5 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date, value) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 1000000;
insert into test.mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 1000000;
select 'table with 2 blocks final';
select * from test.mult_tab final;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

select '-------------------------';

drop table if exists test.mult_tab;
create table test.mult_tab (date Date, value UInt64, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
insert into test.mult_tab select '2018-01-31', number, 0, if(number < 64, 1, -1) from system.numbers limit 128;
insert into test.mult_tab select '2018-01-31', number, 0, if(number < 64, -1, 1) from system.numbers limit 128;
select 'table with 2 blocks final';
select * from test.mult_tab final settings max_block_size=33;
optimize table test.mult_tab;
select 'table with 2 blocks optimized';
select * from test.mult_tab;

DROP TABLE test.mult_tab;
