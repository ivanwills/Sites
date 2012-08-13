package SiteDB::Result::Project;

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

SiteDB::Result::Project

=cut

__PACKAGE__->table("project");

=head1 ACCESSORS

=head2 project_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'project_project_id_seq'

=head2 project_group_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 project

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 description

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=head2 position

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "project_id",
    {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
      sequence          => "project_project_id_seq",
    },
    "project_group_id",
    { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
    "project",
    {
      data_type   => "text",
      is_nullable => 0,
      original    => { data_type => "varchar" },
    },
    "description",
    {
      data_type   => "text",
      is_nullable => 1,
      original    => { data_type => "varchar" },
    },
    "position",
    { data_type => "integer", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("project_id");
__PACKAGE__->add_unique_constraint(
  "project_position_project_group_id_key",
  ["position", "project_group_id"],
);
__PACKAGE__->add_unique_constraint(
  "project_project_project_group_id_key",
  ["project", "project_group_id"],
);

=head1 RELATIONS

=head2 project_group

Type: belongs_to

Related object: L<SiteDB::Result::ProjectGroup>

=cut

__PACKAGE__->belongs_to(
  "project_group",
  "SiteDB::Result::ProjectGroup",
  { project_group_id => "project_group_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 project_links

Type: has_many

Related object: L<SiteDB::Result::ProjectLink>

=cut

__PACKAGE__->has_many(
  "project_links",
  "SiteDB::Result::ProjectLink",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
