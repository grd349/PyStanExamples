// From Will M Farr
data {
  int N;
  real Mobs[N];
  real sigma_obs[N];
}

parameters {
  real mu;
  real<lower=0> sigma;
  real Mtrue_std[N];
}

transformed parameters {
  real Mtrue[N];

  for (i in 1:N) {
    Mtrue[i] = mu + sigma*Mtrue_std[i];
  }
}

model {
  mu ~ normal(0, 10);
  sigma ~ cauchy(0, 1);

  Mtrue_std ~ normal(0,1); /* Implies Mtrue ~ N(mu, sigma) */

  Mobs ~ normal(Mtrue, sigma_obs);
}
