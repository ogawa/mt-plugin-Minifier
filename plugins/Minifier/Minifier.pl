# Minifier
#
# $Id$
#
# This software is provided as-is. You may use it for commercial or
# personal use. If you distribute it, please keep this notice intact.
#
# Copyright (c) 2008 Hirotaka Ogawa

package MT::Plugin::Minifier;
use strict;
use base qw( MT::Plugin );

use MT;

our $VERSION = '0.01';

my $plugin = __PACKAGE__->new(
    {
        name => 'Minifier',
        id   => 'minifier',
        key  => 'minifier',
        description =>
          'Minifier provides mt:cssminifier and mt:jsminifier block tags.',
        doc_link    => 'http://code.as-is.net/public/wiki/Minifier',
        author_name => 'Hirotaka Ogawa',
        author_link => 'http://as-is.net/blog/',
        version     => $VERSION,
    }
);
MT->add_plugin($plugin);

sub instance { $plugin }

sub init_registry {
    my $plugin = shift;
    $plugin->registry(
        {
            tags => {
                block => {
                    'CSSMinifier' => \&_hdlr_css_minifier,
                    'JSMinifier'  => \&_hdlr_js_minifier,
                },
            },
        }
    );
}

sub _hdlr_css_minifier {
    my ( $ctx, $args, $cond ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $out = $builder->build( $ctx, $tokens, $cond ) )
      or return $ctx->error( $builder->errstr );
    require CSS::Minifier;
    CSS::Minifier::minify( input => $out );
}

sub _hdlr_js_minifier {
    my ( $ctx, $args, $cond ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $out = $builder->build( $ctx, $tokens, $cond ) )
      or return $ctx->error( $builder->errstr );
    require JavaScript::Minifier;
    JavaScript::Minifier::minify( input => $out );
}

1;
