
# Laravel Dockerized

```mermaid
%%{init: {'theme': 'dark'}}%%
    graph
    subgraph "Laravel Dockerized"
    A[HOST SRC CODE]
    B[PHP interpreter]
    C[Nginx Web server]
    D[MySQL]
        subgraph "Utility"
        E[Composer]
        F[Laravel Artisan]
        G[npm]
        end
    end
    A <---- B ---> D 
    C  ---> B
    E ---> A
    F ---> A
    G ---> A
```

- Host contains Laravel PHP src, exposed for PHP to interpret our Laravel code to generate response for request. The web server takes the incoming HTTP request, and passes them to PHP interpreter, and then sends the responses back to the client.

## Utilities

- **Composer** is PHP's "npm". I.e. creating Laravel app using Composer.
- **Laravel Artisan** Laravel tool for db migrations.
- **npm** Laravel use npm for some front end logic.
