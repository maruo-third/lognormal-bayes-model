data {
    int N;
    int D;
    vector<lower=0>[N] Y;
    matrix<lower=0, upper=1>[N, D] X;
}

parameters {
    vector[D] b;
    vector[D] a;
}

transformed parameters {
    vector<lower=0>[N] s;
    vector[N] mu;
    
    s = exp(X * b);
    mu = X * a;
}

model {
    Y ~ lognormal(mu, s);
}
