package SiteDB::Result::ProjectLink;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

SiteDB::Result::ProjectLink

=cut

__PACKAGE__->table("project_link");

=head1 ACCESSORS

=head2 project_link_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'project_link_project_link_id_seq'

=head2 project_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 environment_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 url

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 label

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 position

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "project_link_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "project_link_project_link_id_seq",
  },
  "project_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "environment_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "url",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "label",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
  "position",
  { data_type => "integer", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("project_link_id");
__PACKAGE__->add_unique_constraint(
  "project_link_project_id_environment_id_position_key",
  ["project_id", "environment_id", "position"],
);

=head1 RELATIONS

=head2 environment

Type: belongs_to

Related object: L<SiteDB::Result::Environment>

=cut

__PACKAGE__->belongs_to(
  "environment",
  "SiteDB::Result::Environment",
  { environment_id => "environment_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 project

Type: belongs_to

Related object: L<SiteDB::Result::Project>

=cut

__PACKAGE__->belongs_to(
  "project",
  "SiteDB::Result::Project",
  { project_id => "project_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-08-09 15:48:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:l0Unufi5IYk2gphyxyz78Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
