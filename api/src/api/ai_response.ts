import express from "express";
import OpenAI from "openai";
import dotenv from "dotenv";
dotenv.config();
const router = express.Router();
router.use(express.json());
router.use(express.urlencoded({ extended: true }));
// Initialize OpenAI client
const client = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
  baseURL: "https://api.openai.com/v1", 
});

router.post("/ai_response/", async (req, res) => {
  const { userInput } = req.body;
  console.log("Received user input:", userInput);
  if (!userInput) {
    return res.status(400).json({ error: "User input is required" });
  }

  const response = await client.responses.create({
    model: "gpt-3.5-turbo",
    input: userInput,
  });

  console.log(response.output_text);
  const aiResponse = `AI response to: ${userInput}`; // Placeholder for AI response logic
  res.json({ response: aiResponse });
});

export default router;
