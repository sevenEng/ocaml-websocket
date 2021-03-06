(*
 * Copyright (c) 2012-2016 Vincent Bernardoff <vb@luminar.eu.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

(** Module [Rng]: Random string generation for Websocket *)

(** This module offers several random string generators that are conditionally
    built based on the packages available at compile time.
*)

type t = int -> string

val std : ?state:Random.State.t -> t
(** [std] uses the Random module from the stdlib. If no state is passed in,
    then the default state is re-initialized and used. *)

#ifdef NOCRYPTO
val nocrypto : ?g:Nocrypto.Rng.g -> t
(** [nocrypto] uses Nocrypto for RNG generation. Optionally pass in a RNG
    instance via [?g]. *)
#endif

#ifdef CRYPTOKIT
val cryptokit : Cryptokit.Random.rng -> t
(** [cryptokit] uses Cryptokit for RNG generation. Requires a RNG instance. *)
#endif
