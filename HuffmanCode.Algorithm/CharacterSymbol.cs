namespace HuffmanCode.Algorithm
{
    public record CharacterSymbol(char Character) : ISymbol
    {
        public string Value => this.Character.ToString();
    }
}
