package SiteDB::Result::ProjectGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

SiteDB::Result::ProjectGroup

=cut

__PACKAGE__->table("project_group");

=head1 ACCESSORS

=head2 project_group_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'project_group_project_group_id_seq'

=head2 project_group

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
  "project_group_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "project_group_project_group_id_seq",
  },
  "project_group",
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
__PACKAGE__->set_primary_key("project_group_id");
__PACKAGE__->add_unique_constraint("project_group_position_key", ["position"]);
__PACKAGE__->add_unique_constraint("project_group_project_group_key", ["project_group"]);

=head1 RELATIONS

=head2 projects

Type: has_many

Related object: L<SiteDB::Result::Project>

=cut

__PACKAGE__->has_many(
  "projects",
  "SiteDB::Result::Project",
  { "foreign.project_group_id" => "self.project_group_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-08-09 15:48:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:q5TuVM437u+UnRZwPAhM/A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
