import joi from 'joi';

export const urlsSchemma = joi.object({
    url: joi.string().uri().required(),
  });