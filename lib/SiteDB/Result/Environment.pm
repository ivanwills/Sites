package SiteDB::Result::Environment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

SiteDB::Result::Environment

=cut

__PACKAGE__->table("environment");

=head1 ACCESSORS

=head2 environment_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'environment_environment_id_seq'

=head2 environment

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

=head2 shown

  data_type: 'boolean'
  default_value: true
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "environment_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "environment_environment_id_seq",
  },
  "environment",
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
  "shown",
  { data_type => "boolean", default_value => \"true", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("environment_id");
__PACKAGE__->add_unique_constraint("environment_environment_key", ["environment"]);
__PACKAGE__->add_unique_constraint("environment_position_key", ["position"]);

=head1 RELATIONS

=head2 project_links

Type: has_many

Related object: L<SiteDB::Result::ProjectLink>

=cut

__PACKAGE__->has_many(
  "project_links",
  "SiteDB::Result::ProjectLink",
  { "foreign.environment_id" => "self.environment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-08-09 15:48:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gGblWNJjamCv5xFKiPRe0g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
