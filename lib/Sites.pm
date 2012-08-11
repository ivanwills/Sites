package Sites;
use Dancer ':syntax';
use strict;
use warnings;
use Cwd;
use Sys::Hostname;
use examples::simple_form;
use examples::navbar_login;
use examples::tabs;
use examples::show_file;
use examples::photo_gallery;
use examples::markdown;
use examples::template_plugins;
use examples::error_handling;
use SiteDB;

our $VERSION = '0.1';

get '/' => sub {
    my $db = get_db();

    params->{env}   = $db->resultset('Environment')->search({}, {order_by => 'position'});
    params->{links} = $db->resultset('ProjectLink')->search(
        {
        },
        {
            join => [
                {
                    project => 'project_group',
                },
                'environment'
            ],
            '+select' => [qw/ project_group.project_group project.project environment.environment_id /],
            '+as'     => [qw/ project_group               project         environment                /],
            order_by  => [qw/ project_group.position project.position environment.position me.position /],
        },
    );
    params->{test} = 'true';
    template 'index';
};

get '/deploy' => sub {
    template 'deployment_wizard', {
        directory => getcwd(),
        hostname  => hostname(),
        proxy_port=> 8000,
        cgi_type  => "fast",
        fast_static_files => 1,
    };
};

#The user clicked "updated", generate new Apache/lighttpd/nginx stubs
post '/deploy' => sub {
    my $project_dir = param('input_project_directory') || "";
    my $hostname = param('input_hostname') || "" ;
    my $proxy_port = param('input_proxy_port') || "";
    my $cgi_type = param('input_cgi_type') || "fast";
    my $fast_static_files = param('input_fast_static_files') || 0;

    template 'deployment_wizard', {
        directory => $project_dir,
        hostname  => $hostname,
        proxy_port=> $proxy_port,
        cgi_type  => $cgi_type,
        fast_static_files => $fast_static_files,
    };
};

my $db;
sub get_db {
    return $db if $db;
    my $config = config->{SiteDB};

    debug( $SiteDB::VERSION );
    $db = SiteDB->connect($config->{connect}, $config->{user}, $config->{pass});

    return $db;
}

true;
