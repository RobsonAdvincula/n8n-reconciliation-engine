-- Reconciliation Engine Schema

CREATE TABLE IF NOT EXISTS reconciliation_runs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    run_date DATE NOT NULL,
    period VARCHAR(7) NOT NULL, -- e.g. "2024-11"
    total_tax_portal INTEGER,
    total_erp INTEGER,
    exact_matches INTEGER,
    probable_matches INTEGER,
    value_divergent INTEGER,
    missing_in_erp INTEGER,
    missing_in_portal INTEGER,
    cancelled INTEGER,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS reconciliation_results (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    run_id UUID REFERENCES reconciliation_runs(id),
    document_number VARCHAR(100),
    supplier_name VARCHAR(255),
    invoice_date DATE,
    amount NUMERIC(12,2),
    match_status VARCHAR(50), -- exact, probable, divergent, missing_erp, missing_portal, cancelled
    match_level INTEGER,      -- 1-5
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_results_run ON reconciliation_results(run_id);
CREATE INDEX idx_results_status ON reconciliation_results(match_status);
CREATE INDEX idx_results_doc ON reconciliation_results(document_number);
