from torch import nn
import torch

class LSTM(nn.Module):
    def __init__(self, input_size, output_size, hidden_size, num_layers, bidirectional=True):
        super(LSTM, self).__init__()
        self.lstm = nn.LSTM(input_size, hidden_size, num_layers, bidirectional=bidirectional)
        self.Wt_softmax = nn.Linear(num_layers*hidden_size, output_size)
        self.softmax = nn.Softmax()
        
    def forward(self, input, hx):
        output, hx = self.lstm(input, hx)
        output = output.squeeze(1)
        output = self.Wt_softmax(output)
        probs = self.softmax(output)
        actions = probs.multinomial(num_samples=1)
        actions = actions.detach()
        actions_probs = torch.gather(probs, dim=1, index=actions)
        print(actions_probs.shape)
        return actions, actions_probs
    
    def reset_parameters(self):
        self.lstm.reset_parameters()
'''
num_layers = 2
inp = Variable(torch.rand(21, 1, 5))
hx = (Variable(torch.rand(num_layers*2, 1, 10)), Variable(torch.rand(num_layers*2, 1, 10)))

lstm = LSTM(5, 2, 10, 2, bidirectional=True)
actions = lstm.forward(inp, hx)
'''
