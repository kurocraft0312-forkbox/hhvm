<?hh
/**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 */

<<__PHPStdLib>>
function get_defined_functions(): array<string, array<string>>;
<<__PHPStdLib>>
function function_exists(string $function_name, bool $autoload = true): bool;
<<__PHPStdLib>>
function is_callable($v, bool $syntax = false, &$name = null): bool;
function call_user_func_array<T>($function, Container<T> $params);
function call_user_func($function, ...);
<<__PHPStdLib>>
function forward_static_call_array<T>($function, Container<T> $params);
<<__PHPStdLib>>
function forward_static_call($function, ...);
/* A get_called_class is treated at static::class */
<<__Rx>>
function get_called_class(): string; // false if called from outside class
function func_get_arg(int $arg_num);
function func_num_args(): int;
<<__PHPStdLib>>
function register_postsend_function($function, ...);
<<__PHPStdLib>>
function register_shutdown_function($function, ...);
