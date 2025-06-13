import express from 'express';
import dotenv from 'dotenv';
import { GoogleGenAI, Type } from '@google/genai';

dotenv.config();
const router = express.Router();
router.use(express.json());
router.use(express.urlencoded({ extended: true }));
function parametersHandeling(
  gender?: any,
  age?: any,
  relationship?: any,
  budget?: any,
  occasion?: any,
  interests?: any,
) {
  const errors = []; // Array to store all validation errors

  // 1. Check for missing required fields
  if (gender === undefined) errors.push('gender is required');
  if (age === undefined) errors.push('age is required');
  if (relationship === undefined) errors.push('relationship is required');
  if (budget === undefined) errors.push('budget is required');
  if (occasion === undefined) errors.push('occasion is required');
  if (interests === undefined) errors.push('interests is required');

  // 2. Check for correct data types (only if they were provided)
  if (gender !== undefined && typeof gender !== 'string')
    errors.push('gender must be a string');
  if (age !== undefined && typeof age !== 'string')
    errors.push('age must be a string');
  if (relationship !== undefined && typeof relationship !== 'string')
    errors.push('relationship must be a string');
  if (budget !== undefined && typeof budget !== 'string')
    errors.push('budget must be a string');
  if (occasion !== undefined && typeof occasion !== 'string')
    errors.push('occasion must be a string');
  if (interests !== undefined && typeof interests !== 'string')
    errors.push('interests must be a string');

  // return errors if any
  return errors;
}

router.post('/ai_response/', async (req, res) => {
  const { gender, age, relationship, budget, occasion, interests } = req.body;
  let errors = parametersHandeling(
    gender,
    age,
    relationship,
    budget,
    occasion,
    interests,
  );
  if (errors.length > 0) {
    return res.status(400).json({ errors: errors });
  }

  const ai = new GoogleGenAI({ apiKey: process.env.Gemini_API_KEY });
  const response = await ai.models.generateContent({
    model: 'gemini-2.0-flash',
    contents: `Recommend gifts: Gender: ${gender}, Age: ${age}, Relationship: ${relationship}, Budget: ${budget}, Occasion: ${occasion}, Interests: ${interests}. Estimated Price Range. Prioritize relevance, justify choices, and handle budget.Iwant the response in JSON format`,
    config: {
      responseMimeType: 'application/json',
      responseSchema: {
        type: Type.ARRAY,
        items: {
          type: Type.OBJECT,
          properties: {
            giftName: {
              type: Type.STRING,
            },
            description: {
              type: Type.STRING,
            },
            priceRange: {
              type: Type.STRING,
            },
          },
          propertyOrdering: [
            'giftName',
            'description',
            'priceRange',
          ],
        },
      },
    },
  });
  res.json({ response: response.text });
});

export default router;
