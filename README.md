# github-action-label-trigger

```
As a developer,
I want to trigger certain actions from the PR,
when a new label is attached to the PR.
```

```sql
create table user (
	id bigint auto_increment,
	username varchar(255) not null,

	created_at timestamp not null default current_timestamp,
	updated_at timestamp not null default current_timestamp on update current_timestamp,
	primary key (id),
	unique (username)
);
```
