package SiteDB::Result::Environment;

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

1;
