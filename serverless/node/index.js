const express = require('express');
const app = express();
app.use(express.json());

app.post('/extractReminder', (req, res) => {
  res.json({
    title: 'title',
    kind: 'someday',
    dueDate: null,
    startDate: null,
    endDate: null,
    category: 'other',
    priority: 'normal',
    notes: null,
    confidence: 0.0
  });
});

app.listen(3000, () => console.log('Server running'));
