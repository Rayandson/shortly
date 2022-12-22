import joi from 'joi';

export const signUpSchemma = joi.object({
    name: joi.string().min(2).max(60).required(),
    email: joi.string().email().required(),
    password: joi.string().min(5).required(),
    confirmPassword: joi.valid(joi.ref('password')).required(),
  });
