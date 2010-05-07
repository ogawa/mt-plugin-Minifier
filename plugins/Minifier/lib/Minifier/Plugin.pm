# Minifier
#
# $Id$
#
# This software is provided as-is. You may use it for commercial or
# personal use. If you distribute it, please keep this notice intact.
#
# Copyright (c) 2010 Hirotaka Ogawa

package Minifier::Plugin;
use strict;

use MT 4;

=head2 mt:HTMLMinifier

This tag generates a minified version of an input HTML text.

=cut

sub html_minifier {
    my ( $ctx, $args, $cond ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $out = $builder->build( $ctx, $tokens, $cond ) )
      or return $ctx->error( $builder->errstr );
    require HTML::Clean;
    my $opt = {
        shortertags  => 0,
        blink        => 0,
        entities     => 0,
        dequote      => 0,
        htmldefaults => 0,
    };
    for (
        qw(whitespace shortertags blink contenttype comments entities dequote defcolor javascript htmldefaults lowercasetags)
      )
    {
        $opt->{$_} = $args->{$_} if defined $args->{$_};
    }
    my $h = HTML::Clean->new( \$out );
    $h->strip($opt);
    my $data = $h->data();
    $$data;
}

=head2 mt:CSSMinifier

This tag generates a minified version of an input CSS text.

=cut

sub css_minifier {
    my ( $ctx, $args, $cond ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $out = $builder->build( $ctx, $tokens, $cond ) )
      or return $ctx->error( $builder->errstr );
    require CSS::Minifier;
    CSS::Minifier::minify( input => $out );
}

=head2 mt:JSMinifier

This tag generates a minified version of an input JavaScript text.

=cut

sub js_minifier {
    my ( $ctx, $args, $cond ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $out = $builder->build( $ctx, $tokens, $cond ) )
      or return $ctx->error( $builder->errstr );
    require JavaScript::Minifier;
    JavaScript::Minifier::minify( input => $out );
}

1;
