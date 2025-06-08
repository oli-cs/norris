create table `registrations` (
    `user_id` bigint unsigned not null,
    `status` enum('UNREGISTERED','STARTED','NAME_ENTERED','KIND_FOUND','VERIFIED','PRONOUNS_PICKED','REGISTERED','FAILED') NOT NULL,
    `name` varchar(1024),
    `kind` enum('UNDERGRAD','POSTGRAD','MENTOR','SENIOR_MENTOR','HONORARY_MENTOR','FACULTY'),

    primary key (`user_id`)
) engine=InnoDB default charset=utf8 collate=utf8_unicode_ci;

create table `users` (
    `id` bigint unsigned not null auto_increment,
    `name` varchar(1024) not null,
    `kind` enum('UNDERGRAD','POSTGRAD','MENTOR','SENIOR_MENTOR','HONORARY_MENTOR','FACULTY') not null,
    `registered_user_id` bigint unsigned,
    
    primary key (`id`),
    constraint `users_registrations_fk` foreign key (`registered_user_id`) references `registrations` (`user_id`) on delete set null on update cascade
) engine=InnoDB auto_increment=0 default charset=utf8 collate=utf8_unicode_ci;
